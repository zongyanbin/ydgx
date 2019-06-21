<ul id="filters" class="unstyled list-inline">
    <li><button id="all-isotope" class="btn btn-default btn-full mb5 active " data-filter="*">ALL</button></li>
    @foreach (  $product_category->where('pub',1)->get()  as  $index => $item )
        <li><button class="btn btn-default mb5 " data-filter=".{{$item->slug}}">{{$item->title }}</button></li>
    @endforeach
</ul>