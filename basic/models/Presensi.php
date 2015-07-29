<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "presensi".
 *
 * @property integer $id_kebaktian
 * @property integer $id_jemaat
 * @property integer $status
 *
 * @property Jemaat $idJemaat
 * @property Kebaktian $idKebaktian
 */
class Presensi extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'presensi';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['id_kebaktian', 'id_jemaat', 'status'], 'required'],
            [['id_kebaktian', 'id_jemaat', 'status'], 'integer']
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id_kebaktian' => 'Id Kebaktian',
            'id_jemaat' => 'Id Jemaat',
            'status' => 'Status',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getIdJemaat()
    {
        return $this->hasOne(Jemaat::className(), ['id' => 'id_jemaat']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getIdKebaktian()
    {
        return $this->hasOne(Kebaktian::className(), ['id' => 'id_kebaktian']);
    }
}
