<?php

namespace App\Repository;

use App\Entity\Session;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @extends ServiceEntityRepository<Session>
 */
class SessionRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, Session::class);
    }

    //    /**
    //     * @return Session[] Returns an array of Session objects
    //     */
    //    public function findByExampleField($value): array
    //    {
    //        return $this->createQueryBuilder('s')
    //            ->andWhere('s.exampleField = :val')
    //            ->setParameter('val', $value)
    //            ->orderBy('s.id', 'ASC')
    //            ->setMaxResults(10)
    //            ->getQuery()
    //            ->getResult()
    //        ;
    //    }

    //    public function findOneBySomeField($value): ?Session
    //    {
    //        return $this->createQueryBuilder('s')
    //            ->andWhere('s.exampleField = :val')
    //            ->setParameter('val', $value)
    //            ->getQuery()
    //            ->getOneOrNullResult()
    //        ;
    //    }

    // afficher les stagiaire non inscrit dans une session

    public function findNonInscrits($session_id)
    {
        $em = $this->getEntityManager();
        $sub = $em->createQueryBuilder();

        $qb = $sub;
        //selection tout les stagiaire d'une session dont l'id est passé en paramètre
        $qb->select('s')
        ->from('App\Entity\Stagiaire', 's')
        ->leftJoin('s.sessions', 'se')
        ->where('se.id = :id');

        $sub = $em->createQueryBuilder();

        $sub->select('st')
        ->from('App\Entity\Stagiaire', 'st')
        ->where($sub->expr()->notIn('st.id', $qb->getDQL()))
        ->setParameter('id', $session_id)
        ->orderBy('st.nom');

        $query = $sub->getQuery();

        return $query->getResult();
    }

    public function findPastSessions()
    {
        $em = $this->getEntityManager();
        $qb = $em->createQueryBuilder();

        $qb->select('s')
        ->from('App\Entity\Session', 's')
        ->where('s.dateFin < :date')
        ->setParameter('date', new \DateTime('now'))
        ->orderBy('s.dateDebut', 'DESC');

        $query = $qb->getQuery();

        return $query->getResult();
    }

    public function findCurrentSessions()
    {
        $em = $this->getEntityManager();
        $qb = $em->createQueryBuilder();

        $qb->select('s')
        ->from('App\Entity\Session', 's')
        ->where('s.dateDebut <= :date')
        ->andWhere('s.dateFin >= :date')
        ->setParameter('date', new \DateTime('now'))
        ->orderBy('s.dateDebut', 'ASC');

        $query = $qb->getQuery();

        return $query->getResult();
    }

    public function findComingSessions()
    {
        $em = $this->getEntityManager();
        $qb = $em->createQueryBuilder();

        $qb->select('s')
        ->from('App\Entity\Session', 's')
        ->where('s.dateDebut > :date')
        ->setParameter('date', new \DateTime('now'))
        ->orderBy('s.dateDebut', 'ASC');

        $query = $qb->getQuery();

        return $query->getResult();
    }

    public function findModulesNotInSession($session_id)
    {
        $em = $this->getEntityManager();
        $sub = $em->createQueryBuilder();

        $qb = $sub;
        //selection tout les modules d'une session dont l'id est passé en paramètre
        $qb->select('m')
        ->from('App\Entity\Module', 'm')
        ->leftJoin('m.programmes', 'p')
        ->where('p.session = :id');

        $sub = $em->createQueryBuilder();

        $sub->select('mo')
        ->from('App\Entity\Module', 'mo')
        ->where($sub->expr()->notIn('mo.id', $qb->getDQL()))
        ->setParameter('id', $session_id);

        $query = $sub->getQuery();

        return $query->getResult();
    }
}
