import 'package:json_annotation/json_annotation.dart';
part 'api_responses.g.dart';

//register Request
@JsonSerializable()
class ServiceResponses {
  String idlayanan;
  @JsonKey(name: 'nama_layanan')
  String namalayanan;
  int jumlah;
  @JsonKey(name: 'durasi_penyelesaian')
  int durasipenyelesaian;
  int idsatuan;
  int harga;
  int hapus;
  @JsonKey(name: 'nama_satuan')
  String namasatuan;
  @JsonKey(name: 'created_at')
  String createdat;
  @JsonKey(name: 'updated_at')
  String updatedat;
  String durasi;
  String keterangan;

  ServiceResponses(
      {this.idlayanan = '',
      this.namalayanan = '',
      this.jumlah = 0,
      this.durasipenyelesaian = 0,
      this.idsatuan = 0,
      this.harga = 0,
      this.hapus = 0,
      this.namasatuan = '',
      this.createdat = '',
      this.durasi = '',
      this.keterangan = '',
      this.updatedat = ''});

  factory ServiceResponses.fromJson(Map<String, dynamic> json) => _$ServiceResponsesFromJson(json);
  Map<String, dynamic> toJson() => _$ServiceResponsesToJson(this);
}
