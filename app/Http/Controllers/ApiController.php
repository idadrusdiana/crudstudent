<?php

namespace App\Http\Controllers;

use App\Mapel;
use App\Siswa;
use App\User;
use Illuminate\Http\Request;

class ApiController extends Controller
{
    public function editnilai(Request $request, $id)
    {
        $siswa = Siswa::find($id);
        $siswa->mapel()->updateExistingPivot($request->pk,['nilai' => $request->value]);
    }
    
}
