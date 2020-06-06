<?php
use App\Siswa;
use App\Guru;

function ranking5Besar()
{
    $siswa = Siswa::all();
    //map = helper colection untuk modif atribut
    $siswa->map(function($s){
        $s->rataRataNilai = $s->rataRataNilai();
        return $s;
    });
    $siswa = $siswa->sortByDesc('rataRataNilai')->take(5);
    //dd($siswa);
    return $siswa;
}

function totalSiswa()
{
    return Siswa::count();
}

function totalGuru()
{
    return  Guru::count();
}
