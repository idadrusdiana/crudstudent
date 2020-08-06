<?php

namespace App\Http\Controllers;

use App\Mapel;
use App\User;
use App\Siswa;
use Illuminate\Http\Request;
use App\Exports\SiswaExport;
use Maatwebsite\Excel\Facades\Excel;
Use PDF;

class SiswaController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        if ($request->has('cari')) {
            $data_siswa = Siswa::where('nama_depan','LIKE','%'.$request->cari.'%')->paginate(20);
        } else {
            $data_siswa = Siswa::all();
        }        
        return view('siswa.index',['data_siswa' => $data_siswa]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create(Request $request)
    {           
        $this->validate($request,[
            'nama_depan'=> 'required|min:4',
            'nama_belakang' => 'required',
            'email'     => 'required|email|unique:users',
            'jenis_kelamin' => 'required',
            'agama'     => 'required',
            'alamat' => 'required',
            'avatar' => 'mimes:jpeg,png'
        ]);     
        //insert ke table Users
        $user   =   new User;
        $user->role = 'siswa';
        $user->name = $request->nama_depan;
        $user->email    = $request->email;
        $user->password = bcrypt('rahasia');
        $user->remember_token   = str_random(60);
        $user->save(); 

        //insert ke table Siswa
        $request->request->add(['user_id' => $user->id]);
        $siswa  =   Siswa::create($request->all());
        if($request->hasFile('avatar')){
            $request->file('avatar')->move('images/',$request->file('avatar')->getClientOriginalName());
            $siswa->avatar = $request->file('avatar')->getClientOriginalName();
            $siswa->save();
        }        
        return redirect('/siswa')->with('sukses','Data Berhasil diinput');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit(Siswa $siswa)
    {
        return view('siswa/edit',['siswa'=>$siswa]);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Siswa $siswa)
    {          
        $siswa->update($request->all());
        if($request->hasFile('avatar')){
            $request->file('avatar')->move('images/',$request->file('avatar')->getClientOriginalName());
            $siswa->avatar = $request->file('avatar')->getClientOriginalName();
            $siswa->save();
        }
        return redirect('/siswa')->with('sukses','Data Berhasil diupdate');        
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy(Siswa $siswa)
    {        
        $siswa->delete($siswa);

        return redirect('/siswa')->with('sukses','Data Berhasil dihapus');        
    }

    public function profile(siswa $siswa)
    {                       
        $matapelajaran = Mapel::all();
        
        //menyiapkan data untuk chart
        $categories = [];
        $data = [];
        foreach ($matapelajaran as $mp) {
            if ($siswa->mapel()->wherePivot('mapel_id',$mp->id)->first()) {
                $categories[] = $mp->nama;
                $data[] = $siswa->mapel()->wherePivot('mapel_id',$mp->id)->first()->pivot->nilai; 
            }            
        }
        //dd($data);
        //dd(json_encode($categories));

        return view('siswa.profile',['siswa' => $siswa,'matapelajaran' => $matapelajaran,'categories'=>$categories,'data'=>$data]);
    }

    public function addnilai(Request $request, Siswa $siswa)
    {       
        //code untuk mendeteksi bahwa mata peljaran sudah ada
        if($siswa->mapel()->where('mapel_id',$request->mapel)->exists()){
            return redirect('/siswa/'.$siswa->id.'/profile')->with('error','Data mata pelajaran sudah ada.');
        }
        $siswa->mapel()->attach($request->mapel,['nilai' => $request->nilai]);

        return redirect('/siswa/'.$siswa->id.'/profile')->with('sukses','Data nilai berhasil ditambahkan');
    }

    public function deletenilai(Siswa $siswa,$idmapel)
    {               
        $siswa->mapel()->detach($idmapel);

        return redirect()->back()->with('sukses','Data berhasil di hapus');
    }

    public function exportExcel() 
    {
        return Excel::download(new SiswaExport, 'Siswa.xlsx');
    }

    public function exportPdf()
    {
        $siswa = Siswa::all();
        $pdf = PDF::loadView('export.siswapdf',['siswa' => $siswa]);
        return $pdf->download('siswa.pdf');
    }

    public function getdatasiswa()
    {
        $siswa = Siswa::select('siswa.*');

        return \DataTables::eloquent($siswa)
        ->addColumn('nama_lengkap', function($s){
            return $s->nama_depan.' '.$s->nama_belakang;
        })
        ->addColumn('rata2_nilai', function($s){
            return $s->rataRataNilai();
        })
        ->addColumn('aksi', function($s){
            return '<a href="/siswa/'.$s->id.'/profile/" class="btn btn-warning btn-sm">Profile</a>'; 
        })
        ->rawColumns(['nama_lengkap', 'rata2_nilai', 'aksi'])
        ->toJson();
    }

    public function profilesaya()
    {
        return view('siswa.profilesaya');
    }
}
