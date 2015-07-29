<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "kebaktian".
 *
 * @property integer $id
 * @property string $tanggal
 *
 * @property Presensi[] $presensis
 */
class Kebaktian extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'kebaktian';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['tanggal'], 'required'],
            [['tanggal'], 'safe']
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'tanggal' => 'Tanggal',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getPresensis()
    {
        return $this->hasMany(Presensi::className(), ['id_kebaktian' => 'id']);
    }
}
