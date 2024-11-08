<?php
namespace App\Domain\User\DTO;

class SearchUsersDto
{
    public string $searchQuery;
    public int $page;
    public function __construct(
        string $searchQuery,
        int $page,

    ){
        $this->searchQuery = $searchQuery;
        $this->page = $page;
    }
}