<?php
/**
 * Created by PhpStorm.
 * User: Marco Asperti
 * Date: 03/07/2016
 * Time: 11:21
 */
namespace App\maguttiCms\Website\Repos\Article;
/**
 * Interface ArticleRepositoryInterface
 * @package App\maguttiCms\Website\Repos\Article
 */
interface ArticleRepositoryInterface
{
    /**
     * @param $slug
     * @return mixed
     */
    public function getBySlug($slug);
    public function getSubPage($parent, $child);
    
}
