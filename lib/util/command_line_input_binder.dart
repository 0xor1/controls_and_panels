/*
 * Author:  Daniel Robinson http://github.com/0xor1
 */

part of controls_and_panels;

class CommandLineInputBinder{

  final CommandLine commandLine;
  final String _namArgPrfx = '/';
  final List<CommandLineBinding> _bindings = new List<CommandLineBinding>();

  CommandLineInputBinder(this.commandLine){
    commandLine.onUserEntry.listen((String input){
      var inputParts = input.trim().split(' ')..removeWhere((s) => s.isEmpty);
      if(inputParts.length == 0){ return; }

      var cmd = inputParts.removeAt(0);
      var posArgs = new List<String>.from(inputParts.where((s) => !s.startsWith(_namArgPrfx)));
      var namArgs = new Map<String, String>.fromIterable(
        inputParts.where((s) => s.startsWith(_namArgPrfx)),
        key:(String str) => str.substring(_namArgPrfx.length, str.indexOf('=')),
        value:(String str) => str.substring(str.indexOf('=') + 1));
      var binding = _bindings.where((binding) => binding.fullName == cmd || binding.shortName == cmd);

      if(binding.length == 0){
        commandLine.writeEntry('ERROR: <$cmd> not found');
      }

      binding.first.handler(commandLine, posArgs, namArgs);
    });
  }

  void add(CommandLineBinding binding){
    var existingBinding = _bindings.where((b) =>
      b.fullName == binding.fullName ||
      b.fullName == binding.shortName ||
      b.shortName == binding.fullName ||
      b.shortName == binding.shortName);
    if(existingBinding.length > 0){
      throw new DuplicateCommandLineBindingError(binding, existingBinding.first);
    }else{
      _bindings.add(binding);
    }
  }

  void addAll(Iterable<CommandLineBinding> bindings){
    bindings.forEach((cmdLnB) => add(cmdLnB));
  }

  bool remove(CommandLineBinding binding) => _bindings.remove(binding);
}