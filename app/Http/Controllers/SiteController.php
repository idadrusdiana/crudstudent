<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\user;
use App\siswa;
use App\post;
use App\Mail\NotifPendaftaranSiswa;

class SiteController extends Controller
{
    public function home () 
    {
        $posts = Post::all();
        return view('sites.home', compact(['posts']));
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

        // \Mail::raw('Selamat Datang ' .$user->name, function ($message) use($user) {            
        //     $message->to($user->email, $user->name);            ;
        //     $message->subject('Selamat anda sudah terdaftar di Sekolah kami');            
        // });
        
        \Mail::to($user->email)->send(new NotifPendaftaranSiswa);

        return redirect()->route('site.terimakasih')->with('sukses','Data Pendaftaran berhasil dikirm');
    }

    public function singlepost($slug)
    {
        $post = Post::where('slug', '=', $slug)->first();
        return view('sites.singlepost', compact(['post']));
    }   

}
