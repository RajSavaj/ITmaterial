<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use DB;
use Illuminate\Support\Facades\Input;
use \App\Http\Middleware\coras;
class Admininserrt extends Controller
{

  public function __construct()
  {
    $this->middleware(coras::class);
  }

    public function Test(Request $request){
      return view("test");  
    }
    public function login(Request $request){
     $post =$request->all();
     $sql=DB::table('login')->where("Type",$post["type"])->where("Pass",$post["pass"])->get();
     if(isset($sql[0]->Type))
     {
          if ($sql[0]->Type=="Material")
          {
            session(['Material' => 'true']);
             return redirect("/material1");
          }
          elseif ($sql[0]->Type=="Admin") {
              session(['Admin' => 'true']);
              return redirect("/subject1");
          }
     }
     else
     {
      \Session::flash('msg', 'Invalid Login');
        return redirect("/");
     }

    }
    public function subjectSave(Request $request){
    	$post =$request->all();
    	$file=$request->file('sub_image');
     $upload="Subject/";
     $filename=$file->getClientOriginalName();
     $success=$file->move($upload,$filename);
          $data=array('sub_name' => $post['sub_name'], 'sub_image' =>$filename, 'sub_code' => $post["sub_code"] );

       $sqlinsert=DB::table('subject')->insert($data);
       if($sqlinsert > 0)
       {
       	\Session::flash('msg', 'Successfully Inserted');
       	 return redirect('subject1');

       }

    }
    public function getsubject(){
      if(session()->get('Admin'))
      {
       $subject = DB::table('subject')->get();
       return view("subject")->with("subject",$subject);
       }
      else
      {
        if(session()->get('Material'))
        {
          return redirect("/material1");
        }
        else
        {
          return redirect("/");
        }
      }
    }
    public function subdelete($id){
      $d=DB::table('subject')->where('sub_id',$id)->delete();
      if($d > 0)
      {
        \Session::flash('message','successfully Deleted');
      }
      return redirect('subject1');
    }

    public function newsitSave(Request $request){
      $post =$request->all();
      print_r($post);
      $file=$request->file('n_image');
     $upload="newsit/";
     $filename=$file->getClientOriginalName();
     $success=$file->move($upload,$filename);
          $data=array( 'n_image' =>$filename, 'n_contain' => $post['n_contain'], 'n_title' => $post["n_title"] );

       $sqlinsert=DB::table('newsit')->insert($data);
       if($sqlinsert > 0)
       {
        \Session::flash('msg', 'Successfully Inserted');
         return redirect('newsit1');
       }

    }
    public function getnewsit(){
      if(session()->get('Admin'))
      {
        $newsit = DB::table('newsit')->get();
        return view("newsit")->with("newsit",$newsit);
      }
      else
      {
        if(session()->get('Material'))
        {
          return redirect("/material1");
        }
        else
        {
          return redirect("/");
        }      }
    }
    public function newsitdelete($id){
      $d=DB::table('newsit')->where('n_id',$id)->delete();
      if($d > 0)
      {
        \Session::flash('message','successfully Deleted');
      }
      return redirect('newsit1');
    }

    public function material(){
      if(session()->get('Material') || session()->get('Admin'))
        {
          $d=DB::table("subject")->select("sub_name","sub_code")->get();
          $material = DB::table('material')->get();
          return view("material")->with("sub",$d)->with("material1",$material);
        }
        else
        {
          return redirect("/");
        }

    }

    public function materialSave(Request $request){
      $post =$request->all();

      $file=$request->file('mat_pdf');
      $upload="Material/";
      $filename=$file->getClientOriginalName();
      $success=$file->move($upload,$filename);

      $img = str_replace('data:image/png;base64,', '', $post["hidden_data"]);
      $img = str_replace(' ', '+', $img);
      $data = base64_decode($img);
      $file = "Thumb/" . time() . ".png";
      $success = file_put_contents($file, $data);
      $data=array(  'mat_pdf' => $filename, 'mat_name' => $post["mat_name"],'sub_code' => $post["sub_code"],'Thumb'=>$file );
      $sqlinsert=DB::table('material')->insert($data);

       if($sqlinsert > 0)
       {
          \Session::flash('msg', 'Successfully Inserted');
         return redirect('material1');
       }

    }
    public function materialdelete($id){
      $d=DB::table('material')->where('m_id',$id)->delete();
      if($d > 0)
      {
        \Session::flash('message','successfully Deleted');
      }
      return redirect('material1');
    }

    public function assignmentSave(Request $request){
      $post =$request->all();
      print_r($post);
      $file=$request->file('assig_pdf');
     $upload="assignment/";
     $filename=$file->getClientOriginalName();
     $success=$file->move($upload,$filename);
          $data=array( 'assig_pdf' =>$filename, );

       $sqlinsert=DB::table('assignment')->insert($data);
       if($sqlinsert > 0)
       {
        \Session::flash('msg', 'Successfully Inserted');
         return redirect('assignment1');

       }

    }
    public function getassignment(){
      if(session()->get('Material') || session()->get('Admin'))
      {
       $assignment = DB::table('assignment')->get();
       return view("assignment")->with("assignment",$assignment);
      }
      else
      {
        return redirect("/");
      }
    }
    public function assignmentdelete($id){
      $d=DB::table('assignment')->where('assig_id',$id)->delete();
      if($d > 0)
      {
        \Session::flash('message','successfully Deleted');
      }
      return redirect('assignment1');
    }
    public function logout(){
      session()->flush();
      return redirect("/");
    }
}
