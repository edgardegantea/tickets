namespace Config;

use CodeIgniter\Config\BaseConfig;

class Upload extends BaseConfig
{
    public $uploadPath = './uploads/tickets'; // Carpeta de destino para los archivos adjuntos
    public $allowedTypes = 'gif|jpg|png'; // Tipos de archivos permitidos
    public $maxSize = 2048; // Tamaño máximo en kilobytes (KB)

    // ...
}
