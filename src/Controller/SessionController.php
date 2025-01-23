<?php

namespace App\Controller;

use App\Entity\Session;
use App\Repository\SessionRepository;
use Doctrine\ORM\EntityManagerInterface;
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

    #[Route('/session/{id}/stagiaire', name:'show_session_stagiaire')]
    public function show_stagiaire(Session $session): Response
    {
        return $this->render('session/showstagiaire.html.twig', [
            'session' => $session,
        ]);
    }

    #[Route('/session/{id}', name:'show_session')]
    public function show(Session $session, EntityManagerInterface $entityManager): Response
    {
        $nonInscrits = $entityManager->getRepository(Session::class)->findNonInscrits($session->getId());

        return $this->render('session/show.html.twig', [
            'session' => $session,
            'nonInscrits' => $nonInscrits,
        ]);
    }
}
