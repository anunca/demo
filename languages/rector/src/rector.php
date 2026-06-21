<?php

declare(strict_types=1);

use Rector\Config\RectorConfig;
use Rector\CodeQuality\Rector\Class_\CompleteDynamicPropertiesRector;
use Rector\ValueObject\PhpVersion;
use Rector\Set\ValueObject\LevelSetList;
use Rector\TypeDeclaration\Rector\Property\TypedPropertyFromAssignsRector;

return static function (RectorConfig $rectorConfig): void {
  $rectorConfig->paths([
    __DIR__ . '/public',
    __DIR__ . '/src',
  ]);
  // $rectorConfig->phpVersion(PhpVersion::PHP_80);
  // $rectorConfig->phpVersion(PhpVersion::PHP_81);
  $rectorConfig->phpVersion(PhpVersion::PHP_82);
  // $rectorConfig->phpVersion(PhpVersion::PHP_83);
  // $rectorConfig->phpVersion(PhpVersion::PHP_84);
  $rectorConfig->sets([
    // LevelSetList::UP_TO_PHP_80,
    // LevelSetList::UP_TO_PHP_81,
    LevelSetList::UP_TO_PHP_82,
    // LevelSetList::UP_TO_PHP_83,
    // LevelSetList::UP_TO_PHP_84,
  ]);
  $rectorConfig->rule(CompleteDynamicPropertiesRector::class);
  // $rectorConfig->rule(TypedPropertyFromAssignsRector::class);
};

// return RectorConfig::configure()
//   ->withPaths([
//     __DIR__ . '/public',
//     __DIR__ . '/src',
//   ])
//   ->withSets([
//     LevelSetList::UP_TO_PHP_82,
//   ])
//   ->withRules([
//     TypedPropertyFromAssignsRector::class,
//   ]);
