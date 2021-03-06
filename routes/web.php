<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

//untuk uji coba email sudah terkirim
// Route::get('/kirimemail', function() {
//     \Mail::raw('halo siswa baru', function ($message){
//         $message->to('idadrusdiana01@gmail.com', 'Idad');
//         $message->subject('Pendaftaran Siswa');
//     });
// });

Route::get('/', 'SiteController@home');
Route::get('/register', 'SiteController@register');
Route::post('/postregister', 'SiteController@postregister');


Route::get('/about', 'SiteController@about');
Route::get('/terimakasih', 'SiteController@terimakasih')->name('site.terimakasih');

Route::get('/login','AuthController@index')->name('login');
Route::post('/postlogin','AuthController@postlogin');
Route::get('/logout','AuthController@logout');

Route::group(['middleware' => ['auth','checkRole:admin']], function()
    {
        Route::get('/siswa','SiswaController@index');
        Route::post('/siswa/create','SiswaController@create');
        Route::get('/siswa/{siswa}/edit','SiswaController@edit');
        Route::post('/siswa/{siswa}/update','SiswaController@update');
        Route::get('/siswa/{siswa}/delete', 'SiswaController@destroy');
        Route::get('/siswa/{siswa}/profile', 'SiswaController@profile');
        Route::post('/siswa/{siswa}/addnilai','SiswaController@addnilai');
        Route::get('/siswa/{siswa}/{idmapel}/deletenilai','SiswaController@deletenilai');
        Route::get('/siswa/exportexcel','SiswaController@exportExcel');
        Route::get('/siswa/exportpdf','SiswaController@exportPdf');
        Route::post('/siswa/import', 'SiswaController@importexcel')->name('siswa.import');
        Route::get('/guru/{id}/profile', 'GuruController@profile');

        Route::get('/posts','PostController@index')->name('posts.index');
        Route::get('post/add', [
            'uses' => 'PostController@add',
            'as' => 'posts.add'
        ]);
        Route::post('post/create', [
            'uses' => 'PostController@create',
            'as' => 'post.create'            
        ]);
        Route::get('post/{post}/delete', 'PostController@destroy' );

        Route::get('/dashboard','DashboardController@index');
    }
);

Route::group(['middleware' => ['auth','checkRole:admin,siswa']], function(){
    Route::get('/dashboard', 'DashboardController@index')->name('site.dashboard');
    Route::get('/forum', 'ForumController@index');
    Route::post('/forum/create', 'ForumController@create');
    Route::get('/forum/{forum}/view', 'ForumController@view');
});

Route::group(['middleware' => ['auth','checkRole:siswa']], function(){
    Route::get('/profilesaya','SiswaController@profilesaya')->name('profilesaya');
});

Route::get('getdatasiswa',[
    'uses' => 'SiswaController@getdatasiswa',
    'as' => 'ajax.get.data.siswa',
]);

Route::get('/{slug}',[
    'uses' => 'SiteController@singlepost',
    'as' => 'site.single.post'
]);
    
