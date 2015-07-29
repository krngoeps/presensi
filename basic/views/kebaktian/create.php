<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model app\models\Kebaktian */

$this->title = 'Create Kebaktian';
$this->params['breadcrumbs'][] = ['label' => 'Kebaktians', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="kebaktian-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
