<?php

namespace App\Controller;

use App\Entity\Session;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;

final class HomeController extends AbstractController
{
    #[Route('/', name: 'app_home')]
    public function index(EntityManagerInterface $entityManager): Response
    {
        // ajouter condition si pas connecter redirection vers login

        $pastSessions = $entityManager->getRepository(Session::class)->findPastSessions();
        $currentSessions = $entityManager->getRepository(Session::class)->findCurrentSessions();
        $comingSessions = $entityManager->getRepository(Session::class)->findComingSessions();

        return $this->render('home/index.html.twig', [
            'pastsessions' => $pastSessions,
            'currentsessions' => $currentSessions,
            'comingsessions' => $comingSessions,
        ]);
    }
}
