// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_responses.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ServiceResponses _$ServiceResponsesFromJson(Map<String, dynamic> json) =>
    ServiceResponses(
      idlayanan: json['idlayanan'] as String? ?? '',
      namalayanan: json['nama_layanan'] as String? ?? '',
      jumlah: json['jumlah'] as int? ?? 0,
      durasipenyelesaian: json['durasi_penyelesaian'] as int? ?? 0,
      idsatuan: json['idsatuan'] as int? ?? 0,
      harga: json['harga'] as int? ?? 0,
      hapus: json['hapus'] as int? ?? 0,
      namasatuan: json['nama_satuan'] as String? ?? '',
      createdat: json['created_at'] as String? ?? '',
      durasi: json['durasi'] as String? ?? '',
      keterangan: json['keterangan'] as String? ?? '',
      updatedat: json['updated_at'] as String? ?? '',
    );

Map<String, dynamic> _$ServiceResponsesToJson(ServiceResponses instance) =>
    <String, dynamic>{
      'idlayanan': instance.idlayanan,
      'nama_layanan': instance.namalayanan,
      'jumlah': instance.jumlah,
      'durasi_penyelesaian': instance.durasipenyelesaian,
      'idsatuan': instance.idsatuan,
      'harga': instance.harga,
      'hapus': instance.hapus,
      'nama_satuan': instance.namasatuan,
      'created_at': instance.createdat,
      'updated_at': instance.updatedat,
      'durasi': instance.durasi,
      'keterangan': instance.keterangan,
    };
