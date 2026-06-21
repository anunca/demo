<?php

namespace Demo\App\Session;

use SessionHandlerInterface;
use Predis;

class RedisSessionHandler implements SessionHandlerInterface
{
    public function __construct(
        private ?Predis\Client $client = null,
    ) {
        $host = getenv('REDIS_HOST') ?: 'redis';
        $port = getenv('REDIS_PORT') ?: 6379;
        $prefix = getenv('PREFIX') ?: 'prefix:';

        Predis\Autoloader::register();
        $parameters = [
            'scheme' => 'tcp',
            'host'   => $host,
            'port'   => $port,
        ];
        $options = [
            'prefix' => $prefix,
        ];
        $this->client = new Predis\Client($parameters, $options);
    }

    public function open(string $savePath, string $sessionName): bool
    {
        return true;
    }

    public function close(): bool
    {
        return true;
    }

    public function read(string $sessionId): string|false
    {
        return $this->client->get($sessionId) ?: '';
    }

    public function write(string $sessionId, string $data): bool
    {
        $gc = ini_get('session.gc_maxlifetime');
        $status = $this->client->setex($sessionId, $gc, $data)->__toString();
        return $status === 'OK' ? true : false;
    }

    public function destroy(string $sessionId): bool
    {
        return $this->client->del([$sessionId]) > 0;
    }

    public function gc(int $maxLifetime): int|false
    {
        return true;
    }
}
