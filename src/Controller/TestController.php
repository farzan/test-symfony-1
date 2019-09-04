<?php

namespace App\Controller;

use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class TestController
{
    public function test()
    {
        return new Response('Hello <b>World!</b>');
    }
    
    /**
     * @Route("/test2")
     * @return Response
     */
    public function test2()
    {
        return new Response('Another controller');
    }
}