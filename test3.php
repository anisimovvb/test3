<?php
interface itest3
{
    public function read($table);
}

class test3 implements itest3
{

    private $mysql = [
        'host' => 'localhost',
        'user' => 'root',
        'pwd'  => 'vecrek42',
        'db'   => 'test3',
    ];

    private $link;

    private $rf = [
        'RunFlat',
        'Run Flat',
        'ROF',
        'ZP',
        'SSR',
        'ZPS',
        'HRS',
        'RFT',
    ];

    private $season = [
        'Зимние (шипованные)',
        'Внедорожные',
        'Летние',
        'Зимние (нешипованные)',
        'Всесезонные',
    ];

    private $inner_tire = [
        'TT', 'TL', 'TL/TT'
    ];


    public function __construct()
    {
        $this->link = new mysqli($this->mysql['host'],$this->mysql['user'], $this->mysql['pwd'], $this->mysql['db']);

        if (!$this->link) {
            echo "Ошибка: Невозможно установить соединение с MySQL." . PHP_EOL;
            echo "Код ошибки errno: " . mysqli_connect_errno() . PHP_EOL;
            echo "Текст ошибки error: " . mysqli_connect_error() . PHP_EOL;
            exit;
        }

        echo "Соединение с MySQL установлено!" . PHP_EOL;
        echo "Информация о сервере: " . mysqli_get_host_info($this->link) . PHP_EOL;
    }

    public function __destruct()
    {
        $this->link->close();
    }

    public function read($table)
    {
        $result = $this->link->query("SELECT * FROM `src` WHERE 1");
        if($result){
            while ($row = $result->fetch_object()){
                $this->parse($row->name);
            }

        }
    }

    private function parse($row)
    {
        $res = preg_match("/^\S+\s/", $row, $matches);
        $brand = $matches[0];
        $row = $this->cutString($row, $brand);
        echo "Brand: ".$brand;

        $res = preg_match("/^[a-zA-Z0-9-\ \&]+/", $row, $matches);
        $model = substr($matches[0],0,  strlen($matches) -4);
        $row = $this->cutString($row, $model);
        echo "model: ".$model;

        $attr['width'] = $this->parseOption($row, "/^[0-9]+/");
        $row = $this->cutString($row, $attr['width'], 1);

        $attr['height'] = $this->parseOption($row, "/^[0-9]+/");
        $row = $this->cutString($row, $attr['height']);

        $attr['r'] = $this->parseOption($row, "/^[A-Z]+/");
        $row = $this->cutString($row, $attr['r']);

        $attr['radius'] = $this->parseOption($row, "/^[0-9]+/");
        $row = $this->cutString($row, $attr['radius']);

        $attr['load'] = $this->parseOption($row, "/^[0-9]+/");
        $row = $this->cutString($row, $attr['load']);

        $attr['speed'] = $this->parseOption($row, "/^[A-Z]/");
        $row = $this->cutString($row, $attr['speed']);

        $season  = $this->parseOption($row, "/^[а-яА-Я\(\)\ ]+");
        if (in_array($season, $this->season))
            $attr['season'] = $season;


        foreach ($attr as $item){
            if($item == NULL || $model == NULL || $brand == NULL) {
                $this->writeRow($model, $brand, false, $attr);
                return false;
            }
        }


        //Вот это можно считать за костыль)
        for($i=0; $i <=2; $i++){

            $additional = $this->parseOption($row, "/^[A-Z\/]+/");

            if (in_array($additional, $this->inner_tire))
                $attr['inner_tire'] = $additional;

            if (in_array($additional, $this->rf))
                $attr['rf'] = $additional;

            $row = $this->cutString($row, $additional);
        }

        $this->writeRow($model, $brand, true, $attr);
        return true;

    }

    private function parseOption($row, $pattern)
    {
        $res = preg_match($pattern, $row, $matches);
        return $matches[0];
    }

    private function cutString($str, $str2, $oversize = 0)
    {
        return trim(substr($str, strlen($str2) + $oversize));
    }

    public function writeRow($model, $brand, $correct, $attr)
    {
        $this->link->query("INSERT INTO `product` (`brand`, `model`, `correct`) VALUES ('{$brand}', '{$model}','{$correct}')");
        $product_id = $this->link->insert_id;

        if($correct)
            $this->link->query("INSERT INTO `options` (`brand`, `model`, `correct`) VALUES (
'{$product_id}',
'{$attr['width']}',
'{$attr['height']}',
'{$attr['r']}',
'{$attr['radius']}',
'{$attr['load']}',
'{$attr['speed']}',
'{$attr['attr']}',
'{$attr['runflat']}',
'{$attr['inner_tire']}',
'{$attr['season']}',
)");
    }

}


$test3 = new test3();

$test3->read("src");

