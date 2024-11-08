<?php

namespace App\Domain\User\DTO;
use App\Domain\User\Entities\User;

class SearchedUsersResultDto
{
    public int $currentPage;
    public int $maxPage;

    // must be a list of
    /** @var User[] */
    public array $users;

    public function __construct(int $currentPage, int $maxPage, array $users)
    {
        $this->currentPage = $currentPage;
        $this->maxPage = $maxPage;
        $this->users = $users;
    }
}
