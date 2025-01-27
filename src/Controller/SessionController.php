<?php

namespace App\Controller;

use App\Entity\Module;
use App\Entity\Session;
use App\Entity\Programme;
use App\Entity\Stagiaire;
use App\Repository\SessionRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;


final class SessionController extends AbstractController
{
    #[Route('/sessions', name: 'app_session')]
    public function index(EntityManagerInterface $entityManager): Response
    {
        $sessions = $entityManager->getRepository(Session::class)->findAll();

        return $this->render('session/index.html.twig', [
            'sessions' => $sessions,
        ]);
    }

    #[Route('/session/deleteStagiaire/{session}/{stagiaire}', name: 'deletestagiairefromsession')]
    public function deleteStagiaireFromSession(Stagiaire $stagiaire, Session $session, Request $request, EntityManagerInterface $entityManager): Response
    {
        $session->removeStagiaire($stagiaire);
        $entityManager->persist($session);
        $entityManager->flush();

        return $this->redirectToRoute('show_session', ['id' => $session->getId()]);
    }

    #[Route('/session/{id}/deleteProgramme', name: 'deletemodulefromsession')]
    public function deleteModuleFromSession(Programme $programme, EntityManagerInterface $entityManager): Response
    {
        $sessionid = $programme->getSession()->getId();

        $entityManager->remove($programme);
        $entityManager->flush();

        return $this->redirectToRoute('show_session', ['id' => $sessionid]);
    }

    #[Route('/session/addStagiaire/{session}/{stagiaire}', name: 'addstagiairetosession')]
    public function addStagiaireToSession(Session $session, Stagiaire $stagiaire, Request $request, EntityManagerInterface $entityManager): Response
    {

        if ($this->checkDate($session, $stagiaire)) {
            $this->addFlash('error', 'Le stagiaire est déjà inscrit à une session qui se chevauche avec celle-ci');
        } else {
            $session->addStagiaire($stagiaire);
            $entityManager->persist($session);
            $entityManager->flush();
        }

        return $this->redirectToRoute('show_session', ['id' => $session->getId()]);
    }

    private function checkDate(Session $session, Stagiaire $stagiaire)
    {

        if (count($stagiaire->getSessions()) == 0) {
            return false;
        }

        foreach ($stagiaire->getSessions() as $existingSession) {
            if (
                ($session->getDateDebut() >= $existingSession->getDateDebut() && $session->getDateDebut() <= $existingSession->getDateFin()) ||
                ($session->getDateFin() >= $existingSession->getDateDebut() && $session->getDateFin() <= $existingSession->getDateFin()) ||
                ($session->getDateDebut() <= $existingSession->getDateDebut() && $session->getDateFin() >= $existingSession->getDateFin())
            ) {
                return true;
            }
        }
        return false;
    }


    #[Route('/session/{id}/addModule', name: 'addmoduletosession')]
    public function addModuleToSession(Session $session, Request $request, EntityManagerInterface $entityManager): Response
    {
        $moduleId = $request->request->get('moduleId');
        $nbJour = $request->request->get('nbJour');
        $module = $entityManager->getRepository(Module::class)->find($moduleId);

        if ($module) {
            $programme = new Programme();
            $programme->setNbJour($nbJour);
            $session->addProgramme($programme);
            $module->addProgramme($programme);
            $entityManager->persist($session);
            $entityManager->persist($module);
            $entityManager->persist($programme);
            $entityManager->flush();
        }

        return $this->redirectToRoute('show_session', ['id' => $session->getId()]);
    }

    #[Route('/session/{id}', name:'show_session')]
    public function show(Session $session, EntityManagerInterface $entityManager): Response
    {
        $nonInscrits = $entityManager->getRepository(Session::class)->findNonInscrits($session->getId());
        $modulesnotinsession = $entityManager->getRepository(Session::class)->findModulesNotInSession($session->getId());

        return $this->render('session/show.html.twig', [
            'session' => $session,
            'nonInscrits' => $nonInscrits,
            'modulesnotinsession' => $modulesnotinsession,
        ]);
    }

    #[Route('/session/{id}/delete', name: 'delete_session')]
    public function deleteSession(Session $session, EntityManagerInterface $entityManager): Response
    {
        $formationId = $session->getFormation()->getId();

        $entityManager->remove($session);
        $entityManager->flush();

        return $this->redirectToRoute('show_formation', ['id' => $formationId]);
    }
}
