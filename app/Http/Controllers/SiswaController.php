<?php

namespace App\Http\Controllers;

use App\Mapel;
use App\User;
use App\Siswa;
use Illuminate\Http\Request;

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
            $data_siswa = Siswa::where('nama_depan','LIKE','%'.$request->cari.'%')->get();
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
            'nama_depan'=> 'required|min:5',
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
    public function edit($id)
    {
        $siswa = Siswa::find($id);
        return view('siswa/edit',['siswa'=>$siswa]);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {        
        $siswa = Siswa::find($id);
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
    public function destroy($id)
    {
        $siswa = Siswa::find($id);
        $siswa->delete($siswa);
        return redirect('/siswa')->with('sukses','Data Berhasil dihapus');
        
    }

    public function profile($id){
        $siswa = Siswa::find($id);        
        $matapelajaran = Mapel::all();        
        return view('siswa.profile',['siswa' => $siswa,'matapelajaran' => $matapelajaran]);
    }

    public function addnilai(Request $request,$idsiswa){
        $siswa = Siswa::find($idsiswa);
        //code untuk mendeteksi bahwa mata peljaran sudah ada
        if($siswa->mapel()->where('mapel_id',$request->mapel)->exists()){
            return redirect('siswa/'.$idsiswa.'/profile')->with('error','Data mata pelajaran sudah ada.');
        }
        $siswa->mapel()->attach($request->mapel,['nilai' => $request->nilai]);

        return redirect('siswa/'.$idsiswa.'/profile')->with('sukses','Data nilai berhasil ditambahkan');
    }
}
