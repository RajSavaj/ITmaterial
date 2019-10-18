<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use DB;
use Illuminate\Support\Facades\Input;

class ApiController extends Controller
{
   public function subject()
   {
       return response()->json(DB::table('subject')->get());
   }
   public function getseat()
   {
    	$table="demo test";
    	return  response()->json($table);
   }

   public function getStream(Request $request)
   {
      $arr=$request->input("data");
      $myarr=json_decode($arr,true);
      DB::table("test")->insert($myarr);
      //return  response()->json($request);
   }
}
