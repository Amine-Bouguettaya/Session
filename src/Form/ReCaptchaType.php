<?php

namespace App\Form;

use Symfony\Component\Form\FormView;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\Form\FormInterface;

class ReCaptchaType extends AbstractType
{
    public function buildView(FormView $view, FormInterface $form,   array $options)
    {
        $view->vars['type'] = $options['type'];
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults(['type' => 'invisible',]);
        $resolver->setAllowedValues('type', ['checkbox', 'invisible']);
    }
}
