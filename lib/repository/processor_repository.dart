import 'package:processors_info/models/processor_model.dart';
import 'database.dart';

class ProcessorRepository {
  Future<List<ProcessorModel>> findAllAsync() async {
    var database = Database();
    await database.createDatabase();

    List<ProcessorModel> processors;

    if (database.created) {
      processors = new List<ProcessorModel>();

      processors.add(
        new ProcessorModel(
          id: 1,
          brand: 'Intel',
          model: 'i3-9100F Coffee Lake',
          core: 4,
          threads: 4,
          operationFrequency: '3.60 GHz',
          extraDetails:
              'Os processadores da INTEL da linha "F" não possuem vídeo integrado, tornando-se então obrigatório o uso de uma placa de vídeo no slot PCI-E, uma vez que as saídas de vídeo onboard da placa-mãe não irão funcionar.',
        ),
      );

      processors.add(
        new ProcessorModel(
          id: 2,
          brand: 'AMD',
          model: ' YD1600BBAFBOX',
          core: 6,
          threads: 12,
          operationFrequency: '3.2 GHz',
          extraDetails:
              'As linhas de processadores Ryzen 3, 5 e 7 não possuem vídeo integrado, necessário ter uma placa de vídeo off-board.',
        ),
      );

      processors.add(
        new ProcessorModel(
          id: 2,
          brand: 'AMD',
          model: 'YD270XBGAFBOX',
          core: 8,
          threads: 16,
          operationFrequency: '3.7 GHz',
          extraDetails:
              'As linhas de processadores Ryzen 3, 5 e 7 não possuem vídeo integrado, necessário ter uma placa de vídeo off-board.',
        ),
      );

      processors.add(
        new ProcessorModel(
          id: 3,
          brand: 'AMD',
          model: 'YD270XBGAFBOX',
          core: 8,
          threads: 16,
          operationFrequency: '3.7 GHz',
          extraDetails:
              'As linhas de processadores Ryzen 3, 5 e 7 não possuem vídeo integrado, necessário ter uma placa de vídeo off-board.',
        ),
      );

      processors.add(
        new ProcessorModel(
          id: 4,
          brand: 'Intel',
          model: '80386SX',
          core: 0,
          threads: 0,
          operationFrequency: '16 MHz',
          extraDetails:
              'O microprocessador Intel 80386 é um microprocessador da família CISC x86 lançado pela Intel em 1985 e que inaugurou a era da computação de 32 bits na plataforma PC. ',
        ),
      );
    }

    return processors;
  }
}
