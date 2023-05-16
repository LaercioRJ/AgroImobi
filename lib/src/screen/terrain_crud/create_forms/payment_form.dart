import 'package:flutter/material.dart';

class PaymentForm extends StatefulWidget {
  const PaymentForm({super.key});

  @override
  State<PaymentForm> createState() => PaymentFormState();
}

class PaymentFormState extends State<PaymentForm> {

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Formulário de pagamento')
    );
  }
}