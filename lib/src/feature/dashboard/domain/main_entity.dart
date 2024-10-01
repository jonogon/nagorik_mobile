
interface class MainEntity {}

class TabEntity extends MainEntity {
  TabEntity({required this.index});

  final int index;
}

class DataEntity extends MainEntity{
  DataEntity({required this.name});
  final String name;
}
