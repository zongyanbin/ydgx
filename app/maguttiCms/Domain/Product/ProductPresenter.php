<?php
namespace App\maguttiCms\Domain\Product;

use Mcamara\LaravelLocalization\LaravelLocalization;

trait ProductPresenter

{
    /*
    |--------------------------------------------------------------------------
    |  Seo & Meta
    |--------------------------------------------------------------------------
    */
    function getFullSlug($locale = ''){
        /** @var  JSP  trick */
        $locale = ($locale)?:app()->getLocale();
		$trans_url = trans('routes.products', array(),$locale);
		$trans_url = str_replace('{category}', $this->category->{'slug:'.$locale}, $trans_url);
		$trans_url = preg_replace('/\{product\??\}/', $this->{'slug:'.$locale}, $trans_url);
        return $trans_url;
    }

	public function makePermalink($locale = '')
	{
		$locale = ($locale)? $locale: get_locale();
		$this->translate($locale)->permalink = $this->getFullSlug($locale);
		$this->save();
	}

    public function getPermalink($locale = '')
    {
		if (!$this->permalink) {
			$this->makePermalink($locale);
		}
		return url_locale($this->permalink);
    }

    public function getInfoPermalink() {
        return url_locale('/contacts/?product_id='.$this->id);
    }
}
