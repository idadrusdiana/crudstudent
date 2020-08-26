<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Forum;

class ForumController extends Controller
{
    public function index()
    {
        $forum = Forum::with("user.siswa")->orderBy('created_at', 'desc')->paginate(10);        
        return view('forum.index', compact('forum'));
    }

    public function create(Request $request)
    {
        $request->request->add(['user_id' => auth()->user()->id]); //menginputkan secara otomatis berdasarkan user yang login
        $forum = Forum::create($request->all());

        return redirect()->back()->with('sukses', 'Forum Berhasil di tambahkan');        
    }

    public function view( Forum $forum)
    {   
        return view('forum.view', compact(['forum']));
    }
}
