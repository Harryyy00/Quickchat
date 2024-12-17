<?php

namespace App\Domain\User\DTO;
use App\Domain\User\Entities\UserEntity;

class SearchedUsersResultDto
{
    public int $currentPage;
    public int $maxPage;

    // must be a list of
    /** @var UserEntity[] */
    public array $users;

    public function __construct(int $currentPage, int $maxPage, array $users)
    {
        $this->currentPage = $currentPage;
        $this->maxPage = $maxPage;
        $this->users = $users;
    }
}
