@extends('layouts.master')

@section('content')
    <div class="main">
        <div class="main-content">
            <div class="caontainer-fluid">
                <div class="row">
                    <div class="col-md-12">
                        <div class="panel">
                            <div class="panel-heading">
                                <h3 class="panel-title">Posts</h3>                            
                                <div class="right">                                    
                                    <a href="{{ route('posts.add') }}" class="btn btn-sm btn-primary">Add new post</a>                                    
                                </div>
                            </div>
                            <div class="panel-body">
                                <table class="table table-hover">
                                    <thead>
                                        <tr>
                                            <th>ID</th>
                                            <th>TITLE</th>
                                            <th>USER</th>
                                            <th>ACTIONS</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        @foreach ($posts as $post)
                                        <tr>                                            
                                            <td>{{ $post->id }}</td>
                                            <td>{{ $post->title }}</td>
                                            <td>{{ $post->user->name }}</td>                                            
                                            <td>
                                                <a href="{{ route('site.single.post', $post->slug) }}" target="_blank" class="btn btn-info btn-sm">View</a> 
                                                <a href="#" class="btn btn-warning btn-sm">Edit</a>
                                                <a href="#" class="btn btn-danger btn-sm delete">Delete</a>
                                            </td>
                                        </tr>                                            
                                        @endforeach
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    @stop
        
    
    

