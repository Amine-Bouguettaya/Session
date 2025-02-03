<?php

namespace App\Controller;

use App\Entity\Stagiaire;
use App\Form\StagiaireType;
use App\Form\SearchStagiaireType;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;

final class StagiaireController extends AbstractController
{
    // #[Route('/stagiaire', name: 'app_stagiaire')]
    // public function index(Request $request, EntityManagerInterface $entityManager): Response
    // {
    //     $stagiaires = $entityManager->getRepository(Stagiaire::class)->findAll();

    //     $form = $this->createForm(SearchStagiaireType::class);
    //     $form->handleRequest($request);


    //     if ($form->isSubmitted() && $form->isValid()) {
    //         $recherche = $form->getData('text');

    //         return $this->redirectToRoute('displaysearch', ["recherche" => $recherche['text']]);
    //     }

    //     return $this->render('stagiaire/index.html.twig', [
    //         'stagiaires' => $stagiaires,
    //         'formsearch' => $form,
    //     ]);
    // }

    // #[Route('/stagiaire/search/{recherche}', name:'displaysearch')]
    // public function searchStagiaire($recherche, EntityManagerInterface $entityManager)
    // {

    //     // $recherche = $request->request()->get('text');
    //     $stagiaires = $entityManager->getRepository(Stagiaire::class)->search($recherche);
    //     // var_dump($recherche);

    //     return $this->render('stagiaire/searchstagiaire.html.twig', [
    //         'stagiaires' => $stagiaires,
    //     ]);
    // }


    #[Route('/stagiaire', name: 'app_stagiaire')]
    public function index( Request $request, EntityManagerInterface $entityManager): Response
    {

        $form = $this->createForm(SearchStagiaireType::class);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $recherche = $form->getData();
            $stagiaires = $entityManager->getRepository(Stagiaire::class)->search($recherche['text']);
        } else {
            $stagiaires = $entityManager->getRepository(Stagiaire::class)->findAll();
        }

        return $this->render('stagiaire/index.html.twig', [
            'stagiaires' => $stagiaires,
            'formsearch' => $form,
        ]);
    }

    #[Route('/stagiaire/delete/{id}', name: 'delete_stagiaire')]
    public function deleteStagiaire(Stagiaire $stagiaire, EntityManagerInterface $entityManager): Response
    {
        $entityManager->remove($stagiaire);
        $entityManager->flush();

        return $this->redirectToRoute('app_stagiaire');
    }

    #[Route('/stagiaire/new', name:'new_stagiaire')]
    #[Route('/stagiaire/{id}/edit', name: 'edit_stagiaire')]
    public function newedit(Stagiaire $stagiaire = null, Request $request, EntityManagerInterface $entityManager):Response
    {
        if (!$stagiaire) {
            $stagiaire = new Stagiaire();
        }

        $form = $this->createForm(StagiaireType::class, $stagiaire);

        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $stagiaire = $form->getData();

            $entityManager->persist($stagiaire);
            $entityManager->flush();
            return $this->redirectToRoute('app_stagiaire');
        }

        return $this->render('stagiaire/newedit.html.twig', [
            'formAddStagiaire' => $form,
            'edit' => $stagiaire->getId(),
        ]);
    }

    #[Route('/stagiaire/{id}', name:'show_stagiaire')]
    public function show($id, EntityManagerInterface $entityManager): Response
    {
        $stagiaire = $entityManager->getRepository(Stagiaire::class)->find($id);

        if (!$stagiaire) {
            return $this->redirectToRoute('app_stagiaire');
        }

        return $this->render('stagiaire/show.html.twig', [
            'stagiaire' => $stagiaire,
        ]);
    }
}
