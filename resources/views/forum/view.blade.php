@extends('layouts.master')

@section('content')
<div class="main">
    <div class="main-content">
        <div class="caontainer-fluid">
            <div class="row">
                <div class="col-md-12">
                    <div class="panel panel-headline">
                        <div class="panel-heading">
                            <h3 class="panel-title">{{ $forum->judul }}</h3>
                            <p class="panel-subtitle">{{ $forum->created_at->diffForHumans() }}</p>                            
                        </div>
                        <div class="panel-body">                               
                            {{ $forum->konten }}
                            <hr>
                            <h4>Komentar</h4>
                            <ul class="list-unstyled activity-list">                                
                                <li>
                                    <img src="#" alt="Avatar" class="img-circle pull-left avatar">
                                    <p><a href="#">laravel laravel laravel larave laravel laravel<span class="timestamp">
                                        10 minute ago</span></p>
                                </li>                                                                                                   
                            </ul>
                        </div>                        
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection