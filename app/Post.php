<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Cviebrock\EloquentSluggable\Sluggable;

class Post extends Model
{
    use Sluggable;

    protected $table = 'posts';
    protected $fillable = ['title', 'content', 'slug', 'thumbnail', 'user_id'];
    protected $dates = ['created_at'];

    public function sluggable()
    {
        return [
            'slug' => [
                'source' => 'title'
            ]
        ];
    }

    public function user()
    {
        return $this->belongsTo(User::class);
    }

    public function thumbnail()
    {
        // if ($this->thumbnail) {
        //     return $this->thumbnail;
        // }else{
        //     return asset('img/blog/feature-img1.jpg');
        // }

        // if ($this->thumbnail) {
        //     return asset('img/blog/feature-img1.jpg');
        // }

        // return $this->thumbnail;

        //kodingannya lebih sedikit
        return !$this->thumbnail ? asset('cat-widget2.jpg') : $this->thumbnail ;
    }
}
