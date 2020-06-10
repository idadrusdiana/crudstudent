    <table class="table" style="border:1px solid #ddd">
        <thead>
        <tr>  
            <th>NO</th>      
            <th>NAMA LENGKAP</th>
            <th>JENIS KELAMIN</th>
            <th>AGAMA</th>
            <th>RATA-RATA NILAI</th>
        </tr>
        </thead>
        
        <tbody>
            <?php $no=1;?>
            @foreach ($siswa as $s)
            <tr>
                <td style="text-align: center">{{ $no++ }}</td>
                <td style="text-align: left">{{ $s->nama_lengkap() }}</td>
                <td style="text-align: center">{{ $s->jenis_kelamin }}</td>
                <td style="text-align: center">{{ $s->agama }}</td>
                <td style="text-align: center">{{ $s->rataRataNilai() }}</td>  
            </tr>           
            @endforeach       
        </tbody>
    </table>
