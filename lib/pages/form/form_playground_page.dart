import 'package:flutter/material.dart';

class FormPlaygroundPage extends StatelessWidget {
  const FormPlaygroundPage._();

  static const routeName = '/form_playground';

  static Route<void> route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const FormPlaygroundPage._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Form(
        child: SingleChildScrollView(
          child: _Fields(),
        ),
      ),
    );
  }
}

class _Fields extends StatelessWidget {
  const _Fields();

  @override
  Widget build(BuildContext context) {
    final form = Form.of(context);

    void validate() {
      final invalidFields = form.validateGranularly();

      if (invalidFields.firstOrNull case final firstInvalidateField?) {
        Scrollable.ensureVisible(
          firstInvalidateField.context,
          duration: const Duration(milliseconds: 240),
        );
      }
    }

    void reset() {
      form.reset();
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          Row(
            children: [
              FilledButton(
                onPressed: validate,
                child: const Text('validate'),
              ),
              const SizedBox(width: 8),
              OutlinedButton(
                onPressed: reset,
                child: const Text('reset'),
              ),
            ],
          ),

          // 7番目のやつだけ強制的にエラー出すやつ
          for (var i = 0; i < 10; i++)
            Padding(
              padding: const EdgeInsets.only(bottom: 64),
              child: Row(
                children: [
                  Text('$i:'),
                  Expanded(
                      child: TextFormField(
                    validator: (_) => i == 7 ? 'error' : null,
                  )),
                ],
              ),
            )
        ],
      ),
    );
  }
}
