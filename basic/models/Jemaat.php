<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "jemaat".
 *
 * @property integer $id
 * @property string $nama
 * @property string $panggilan
 * @property string $angkatan
 * @property string $jenis_kelamin
 *
 * @property Presensi[] $presensis
 */
class Jemaat extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'jemaat';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['nama', 'panggilan', 'angkatan', 'jenis_kelamin'], 'required'],
            [['angkatan'], 'safe'],
            [['jenis_kelamin'], 'string'],
            [['nama', 'panggilan'], 'string', 'max' => 100]
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'nama' => 'Nama',
            'panggilan' => 'Panggilan',
            'angkatan' => 'Angkatan',
            'jenis_kelamin' => 'Jenis Kelamin',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getPresensis()
    {
        return $this->hasMany(Presensi::className(), ['id_jemaat' => 'id']);
    }
}
