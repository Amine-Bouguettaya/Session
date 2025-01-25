<?php

namespace App\Controller;

use App\Entity\Module;
use App\Entity\Category;
use App\Form\ModuleType;
use App\Form\CategoryType;
use App\Repository\CategoryRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;

final class CategoryController extends AbstractController
{
    #[Route('/category', name: 'app_category')]
    public function index(EntityManagerInterface $entityManager): Response
    {

        $categories = $entityManager->getRepository(Category::class)->findAll();

        return $this->render('category/index.html.twig', [
            'categories' => $categories,
        ]);
    }

    #[Route('/category/{id}/addModule', name: 'add_module')]
    public function addModule(Category $category, Request $request, EntityManagerInterface $entityManager): Response
    {
        $module = new Module();
        $form = $this->createForm(ModuleType::class, $module);

        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $module = $form->getData();
            $category->addModule($module);

            $entityManager->persist($module);
            $entityManager->flush();
            return $this->redirectToRoute('show_category', ['id' => $category->getId()]);
        }

        return $this->render('category/addModule.html.twig', [
            'formAddModule' => $form,
            'category' => $category,
        ]);
    }

    #[Route('/category/new', name:'new_category')]
    #[Route('/category/{id}/edit', name: 'edit_category')]
    public function new_edit(Category $category = null, Request $request, EntityManagerInterface $entityManager):Response
    {
        if (!$category) {
            $category = new Category();
        }

        $form = $this->createForm(CategoryType::class, $category);

        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $category = $form->getData();

            $entityManager->persist($category);
            $entityManager->flush();
            return $this->redirectToRoute('app_category');
        }

        return $this->render('category/newedit.html.twig', [
            'formAddCategory' => $form,
            'edit' => $category->getId(),
        ]);
    }

    #[Route('/category/{id}', name: 'show_category')]
    public function show(Category $category): Response
    {
        return $this->render('category/show.html.twig', [
            'category' => $category,
        ]); 
    }

}
