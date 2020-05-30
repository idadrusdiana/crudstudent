@extends('layouts.master')

@section('header')
    <link href="//cdnjs.cloudflare.com/ajax/libs/x-editable/1.5.0/bootstrap3-editable/css/bootstrap-editable.css" rel="stylesheet"/>
@stop

@section('content')
    <div class="main">
        <!-- MAIN CONTENT -->
        <div class="main-content">
            <div class="container-fluid">
                @if (session('sukses'))
                    <div class="alert alert-success" role="alert">
                        {{ session('sukses') }}
                    </div>  
                @endif
                @if (session('error'))
                    <div class="alert alert-danger" role="alert">
                        {{ session('error') }}
                    </div>  
                @endif
                <div class="panel panel-profile">
                    <div class="clearfix">
                        <!-- LEFT COLUMN -->
                        <div class="profile-left">
                            <!-- PROFILE HEADER -->
                            <div class="profile-header">
                                <div class="overlay"></div>
                                <div class="profile-main">
                                    <img src="" class="img-circle" alt="Avatar">
                                    <h3 class="name">{{ $guru->nama }}</h3>
                                    <span class="online-status status-available">Available</span>
                                </div>
                                
                            </div>
                            
                        </div>

                        <!-- RIGHT COLUMN -->
                        <div class="profile-right">                       
                            {{-- Table Striped --}}
                            <div class="panel">
                                <div class="panel-heading">
                                    <h3 class="panel-title">Mata Pelajaran yang diajar oleh {{ $guru->nama  }}</h3>
                                </div>
                                
                                <div class="panel-body">
                                    <table class="table table-striped">
                                        <thead>
                                            <tr>
                                                <th>Nama</th>
                                                <th>Semester</th>                                                
                                            </tr>
                                        </thead>
                                        <tbody>
                                            @foreach ($guru->mapel as $mapel)                              
                                            <tr>
                                                <td>{{ $mapel->nama }}</td>
                                                <td>{{ $mapel->semester }}</td>                                               
                                            </tr> 
                                            @endforeach                                            
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <div class="panel">
                                <div id="chartNilai"></div>
                            </div>
                            {{-- End Table Stripped --}}
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- END MAIN CONTENT -->
    </div>    

@stop

@section('footer')
    
@stop