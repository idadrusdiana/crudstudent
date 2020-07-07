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
                                    <a href="/siswa/exportpdf" class="btn btn-sm btn-primary">Add new post</a>                                    
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
                                                <a href="{{ route('site.single.post', $post->slug) }}" class="btn btn-info btn-sm">View</a> 
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

    <!-- Modal -->
    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
    <div class="modal-content">
    <div class="modal-header">
    <h5 class="modal-title" id="exampleModalLabel">Form Data Siswa</h5>
    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
        <span aria-hidden="true">&times;</span>
    </button>
    </div>
    <div class="modal-body">
        <form action="siswa/create" method="POST" enctype="multipart/form-data">
            {{ csrf_field() }}
            <div class="form-group{{ $errors->has('nama_depan') ? ' has-error' : ''}}">
                <label for="exampleInputEmail1">Nama Depan</label>
                <input type="text" name="nama_depan" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Nama Depan" value="{{ old('nama_depan') }}">                      
                @if ($errors->has('nama_depan'))
                    <span class="help-block">{{ $errors->first('nama_depan') }}</span>                
                @endif
            </div>
            <div class="form-group{{ $errors->has('nama_belakang') ? ' has-error' : '' }}">
                <label for="exampleInputEmail1">Nama Belakang</label>
                <input type="text" name="nama_belakang" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Nama Belakang" value="{{ old('nama_belakang') }}">                      
                @if ($errors->has('nama_belakang'))
                    <span class="help-block">{{ $errors->first('nama_belakang') }}</span>
                @endif
            </div>
            <div class="form-group{{ $errors->has('email') ? ' has-error' : '' }}">
                <label for="exampleInputEmail1">Email</label>
                <input type="email" name="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="email" value="{{ old('email') }}">                      
                @if ($errors->has('email'))
                    <span class="help-block">{{ $errors->first('email') }}</span>                    
                @endif
            </div>
            <div class="form-group{{ $errors->has('jenis_kelamin') ? ' has-error' : ''}}">
                <label for="exampleFormControlSelect1">Pilih Jenis Kelamin</label>
                <select name="jenis_kelamin" class="form-control" id="exampleFormControlSelect1">
                <option value="L" {{ (old('jenis_kelamin') == 'L') ? ' selected' : '' }}>Laki-laki</option>
                <option value="P" {{ (old('jenis_kelamin') == 'P') ? ' selected' : '' }}>Perempuan</option>                          
                </select>
                @if ($errors->has('jenis_kelamin'))
                    <span class="help-block">{{ $errors->first('jenis_kelamin') }}</span>
                @endif
            </div>
            <div class="form-group{{ $errors->has('agama') ? ' has-error' : '' }}">
                <label for="exampleInputEmail1">Agama</label>
                <input type="text" name="agama" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Agama" value="{{ old('agama') }}"> 
                @if ($errors->has('agama'))
                    <span class="help-block">{{ $errors->first('agama') }}</span>
                @endif                     
            </div>
            <div class="form-group">
                <label for="exampleFormControlTextarea1">Alamat</label>
                <textarea name="alamat" class="form-control" id="exampleFormControlTextarea1" rows="3">{{ old('alamat') }}</textarea>
            </div>
            <div class="form-group{{ $errors->has('avatar') ? ' has-error' : '' }}">
                <label for="exampleFormControlTextarea1">Avatar</label>
                <input type="file" name="avatar" class="form">
                @if ($errors->has('avatar'))
                    <span class="help-block">{{ $errors->first('avatar') }}</span>                    
                @endif
            </div>            
    </div>
    <div class="modal-footer">
    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
            <button type="submit" class="btn btn-primary">Submit</button>
        </form>
    </div>
    </div>
    </div>
    </div>
@stop

@section('footer')
    <script>
        $('.delete').click(function(){
            var siswa_id = $(this).attr('siswa-id');
            swal({
                title: "Yakin ?",
                text: "Mau dihapus data siswa dengan id "+siswa_id+" ??",
                icon: "warning",
                buttons: true,
                dangerMode: true,
            })
            .then((willDelete) => {
                console.log(willDelete);
            if (willDelete) {
                window.location = "/siswa/"+siswa_id+"/delete";
            }
            });
        });
    </script>
@stop
        
    
    

