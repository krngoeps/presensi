<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\Jemaat */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="jemaat-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'nama')->textInput(['maxlength' => 100]) ?>

    <?= $form->field($model, 'panggilan')->textInput(['maxlength' => 100]) ?>

    <?= $form->field($model, 'angkatan')->textInput(['maxlength' => 4]) ?>

    <?= $form->field($model, 'jenis_kelamin')->dropDownList([ 'cowok' => 'Cowok', 'cewek' => 'Cewek', ], ['prompt' => '']) ?>

    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? 'Create' : 'Update', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
