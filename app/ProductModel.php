<?php namespace App;

use Illuminate\Database\Eloquent\Model;
use \App\maguttiCms\Translatable\GFTranslatableHelperTrait;

class ProductModel extends Model
{

    use \Dimsav\Translatable\Translatable;
    use GFTranslatableHelperTrait;


    public    $translatedAttributes = ['title','description'];
    protected $fillable  = ['product_id','title','description','sort','pub'];
    protected $fieldspec = [];

    public function product()
    {
        return $this->belongsTo('App\Product');
    }
    public function finishing()
    {
        return $this->belongsTo('App\Domain');
    }

    function getFieldSpec ()
    {

        $this->fieldspec['id'] = [
            'type'     => 'integer',
            'minvalue' => 0,
            'pkey'     => 'y',
            'required' => 1,
            'label'    => 'id',
            'hidden'   => 1,
            'display'  => 0,
        ];
        $this->fieldspec['product_id'] = [
            'type'        => 'relation',
            'model'       => 'Product',
            'foreign_key' => 'id',
            'label_key'   => 'title',
            'label'       => 'Product',
            'hidden'      => 0,
            'required'    => 1,
            'display'     => 1,

        ];
        $this->fieldspec['title'] = [
            'type'     => 'string',
            'required' => 1,
            'hidden'   => 0,
            'label'    => 'title',
            'display'  => 1,
        ];
        $this->fieldspec['description'] = [
            'type'      => 'text',
            'size'      => 600,
            'h'         => 300,
            'required'  => 0,
            'hidden'    => 0,
            'label'     => 'Description',
            'cssClass'  => 'wyswyg',
            'display'   => 1,
        ];
        $this->fieldspec['image'] = [
            'type'      => 'media',
            'required'  => 0,
            'hidden'    => 0,
            'label'     => 'Image',
            'mediaType' => 'Img',
            'display'   => 1
        ];

        $this->fieldspec['sort'] = [
            'type'     => 'integer',
            'required' => 0,
            'label'    => 'Order',
            'hidden'   => 0,
            'display'  => 1,
        ];
        $this->fieldspec['pub'] = [
            'type'     => 'boolean',
            'required' => 0,
            'hidden'   => 0,
            'label'    => trans('admin.label.publish'),
            'display'  => 1
        ];

        return $this->fieldspec;
    }
}
