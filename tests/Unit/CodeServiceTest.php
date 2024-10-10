<?php

namespace Tests\Unit;

use App\Services\CodeService;
use PHPUnit\Framework\TestCase;

class CodeServiceTest extends TestCase
{
    /**
     * Single code test.
     */
    public function test_that_single_code_is_generated(): void
    {
        $service = new CodeService();

        $result = $service->random();

        $this->assertIsString($result);
    }

    /**
     * Multiple code test.
     */
    public function test_that_multiple_codes_is_generated(): void
    {
        $service = new CodeService();

        $result = $service->generate(5);

        $this->assertIsArray($result);
        $this->assertCount(5, $result);
    }
}
