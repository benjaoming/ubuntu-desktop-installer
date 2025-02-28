import 'package:filesize/filesize.dart';
import 'package:subiquity_client/subiquity_client.dart';

export 'package:subiquity_client/subiquity_client.dart'
    show Disk, DiskObject, Gap, GapUsable, Partition;

extension GapExtension on Gap {
  bool get tooManyPrimaryPartitions =>
      usable == GapUsable.TOO_MANY_PRIMARY_PARTS;
}

extension DiskExtension on Disk {
  String get prettySize => filesize(size);
}

extension PartitionExtension on Partition {
  bool get canWipe => PartitionFormat.fromPartition(this)?.canWipe == true;
  bool get isWiped => wipe == 'superblock';
  String get prettySize => filesize(size ?? 0);
}

/// Available partition formats.
class PartitionFormat {
  const PartitionFormat._(this.type);

  /// The type of the partition format (e.g. 'ext4').
  final String type;

  /// Whether a partition with this format can be wiped.
  bool get canWipe => type != 'swap';

  @override
  String toString() => type;

  static const btrfs = PartitionFormat._('btrfs');
  static const ext2 = PartitionFormat._('ext2');
  static const ext3 = PartitionFormat._('ext3');
  static const ext4 = PartitionFormat._('ext4');
  static const fat = PartitionFormat._('fat');
  static const fat12 = PartitionFormat._('fat12');
  static const fat16 = PartitionFormat._('fat16');
  static const fat32 = PartitionFormat._('fat32');
  static const iso9660 = PartitionFormat._('iso9660');
  static const vfat = PartitionFormat._('vfat');
  static const jfs = PartitionFormat._('jfs');
  static const ntfs = PartitionFormat._('ntfs');
  static const reiserfs = PartitionFormat._('reiserfs');
  static const swap = PartitionFormat._('swap');
  static const xfs = PartitionFormat._('xfs');
  static const zfsroot = PartitionFormat._('zfsroot');

  /// The default partition format.
  static PartitionFormat get defaultValue => _formats['ext4']!;

  /// Converts a Partition object to a PartitionFormat enum value.
  static PartitionFormat? fromPartition(Partition partition) =>
      _formats[partition.format];

  /// All available partition formats.
  static List<PartitionFormat> get values => _formats.values.toList();

  /// Partition formats supported for new partitions.
  static List<PartitionFormat> get supported => [ext4, xfs, btrfs, swap];

  static const _formats = <String, PartitionFormat>{
    'btrfs': btrfs,
    'ext2': ext2,
    'ext3': ext3,
    'ext4': ext4,
    'fat': fat,
    'fat12': fat12,
    'fat16': fat16,
    'fat32': fat32,
    'iso9660': iso9660,
    'vfat': vfat,
    'jfs': jfs,
    'ntfs': ntfs,
    'reiserfs': reiserfs,
    'swap': swap,
    'xfs': xfs,
    'zfsroot': zfsroot,
  };
}
