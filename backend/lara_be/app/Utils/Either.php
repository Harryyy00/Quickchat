<?php

namespace App\Utils;

class Either
{
    private $left;
    private $right;

    private function __construct($left = null, $right = null)
    {
        $this->left = $left;
        $this->right = $right;
    }

    public static function left($value): Either
    {
        return new self($value, null);
    }

    public static function right($value): Either
    {
        return new self(null, $value);
    }

    public function isRight(): bool
    {
        return !is_null($this->right);
    }

    public function unwrap(): mixed
    {
        return $this->isRight() ? $this->right : $this->left;
    }
}
