<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\user;
use App\siswa;

class SiteController extends Controller
{
    public function home () 
    {
        return view('sites.home');
    }

    public function about()
    {
        return view('sites.about');
    }

    public function terimakasih()
    {
        return view('sites.terimakasih');
    }

    public function register()
    {
        return view('sites.register');
    }

    public function postregister(Request $request)
    {
        //dd($request->all());

        //input pendaftaran sebagai user
         $user   =   new User;
         $user->role = 'siswa';
         $user->name = $request->nama_depan;
         $user->email    = $request->email;
         $user->password = bcrypt($request->password);
         $user->remember_token   = str_random(60);
         $user->save();
         
        $request->request->add(['user_id' => $user->id]);
        $siswa  =   Siswa::create($request->all());

        return redirect('/terimakasih')->with('sukses','Data Pendaftaran berhasil dikirm');
    }

}
