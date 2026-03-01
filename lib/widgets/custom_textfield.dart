Widget customTextField(String label, TextEditingController controller) {
  return TextField(
    controller: controller,
    decoration: InputDecoration(
      labelText: label,
      border: OutlineInputBorder(),
    ),
  );
}