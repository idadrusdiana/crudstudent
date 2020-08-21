@extends('layouts.master')

@section('content')
    <div class="main">
        <div class="main-content">
            <div class="caontainer-fluid">
                <div class="row">
                    <div class="col-md-12">
                        <div class="panel">
                            <div class="panel-heading">
                                <h3 class="panel-title">Forum</h3>                            
                                <div class="right">                                    
                                    <a href="#" class="btn btn-sm btn-primary">Add new Forum</a>                                    
                                </div>
                            </div>
                            <div class="panel-body">                               
                                <ul class="list-unstyled activity-list">
                                    @foreach ($forum as $frm)
                                        <li>
                                            <img src="{{$frm->user->siswa->getAvatar()}}" alt="Avatar" class="img-circle pull-left avatar">
                                            <p><a href="#">{{ $frm->user->siswa->nama_depan }} : {{ $frm->judul }} <span class="timestamp">{{ $frm->created_at->diffForHumans() }}</span></p>
                                        </li>    
                                    @endforeach                                                                      
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
@stop