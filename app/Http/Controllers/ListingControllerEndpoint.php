<?php

namespace App\Http\Controllers;

use App\Transformers\MoviesToDto;
use Illuminate\Http\Request;
use Illuminate\Http\JsonResponse;

class ListingControllerEndpoint extends Controller
{

    private $movieRepository;

        public function __construct()
        {

        }

        public function __invoke()
        {
        $timestamp = time();
            return new JsonResponse([
                "time" => "$timestamp"
            ]);
        }
}