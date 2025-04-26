import 'package:expenses_tracker_app/models/expenses_model.dart';
import 'package:flutter/material.dart';

class ModalSheet extends StatefulWidget {
  const ModalSheet({super.key, required this.onAddExpense});
  final void Function(ExpensesModel expense) onAddExpense;

  @override
  State<ModalSheet> createState() => _ModalSheetState();
}

class _ModalSheetState extends State<ModalSheet> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  DateTime? selectedDate;
  Category selectedCategory = Category.food;

  @override
  void dispose() {
    titleController.dispose();
    amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        return SizedBox(
          height: double.infinity,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(
                left: 16,
                right: 16,
                top: 16,
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: Column(
                children: [
                  if (width >= 600)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: TextField(
                            controller: titleController,
                            maxLength: 50,
                            decoration: InputDecoration(label: Text('Title')),
                          ),
                        ),
                        SizedBox(width: 12),
                        Expanded(
                          child: TextField(
                            keyboardType: TextInputType.number,
                            controller: amountController,
                            decoration: InputDecoration(
                              label: Text('Amount'),
                              prefixText: '\$',
                            ),
                          ),
                        ),
                      ],
                    )
                  else
                    TextField(
                      controller: titleController,
                      maxLength: 50,
                      decoration: InputDecoration(label: Text('Title')),
                    ),
                  SizedBox(height: 5),
                  if (width >= 600)
                    Row(
                      children: [
                        DropdownButton(
                          borderRadius: BorderRadius.circular(16),
                          alignment: Alignment.center,
                          value: selectedCategory,
                          items:
                              Category.values.map((category) {
                                return DropdownMenuItem(
                                  value: category,
                                  child: Text(category.name.toUpperCase()),
                                );
                              }).toList(),
                          onChanged: (value) {
                            if (selectedCategory == null) {
                              return;
                            }
                            setState(() {
                              selectedCategory = value!;
                            });
                          },
                        ),
                        SizedBox(width: 12),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                selectedDate == null
                                    ? 'Select a date'
                                    : formmater.format(selectedDate!),
                              ),
                              IconButton(
                                onPressed: () async {
                                  final now = DateTime.now();
                                  final pickedDate = await showDatePicker(
                                    context: context,
                                    firstDate: DateTime(
                                      now.year - 1,
                                      now.month,
                                      now.day,
                                    ),
                                    lastDate: now,
                                  );
                                  setState(() {
                                    selectedDate = pickedDate;
                                  });
                                },
                                icon: Icon(Icons.calendar_month),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  else
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            keyboardType: TextInputType.number,
                            controller: amountController,
                            decoration: InputDecoration(
                              label: Text('Amount'),
                              prefixText: '\$',
                            ),
                          ),
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                selectedDate == null
                                    ? 'Select a date'
                                    : formmater.format(selectedDate!),
                              ),
                              IconButton(
                                onPressed: () async {
                                  final now = DateTime.now();
                                  final pickedDate = await showDatePicker(
                                    context: context,
                                    firstDate: DateTime(
                                      now.year - 1,
                                      now.month,
                                      now.day,
                                    ),
                                    lastDate: now,
                                  );
                                  setState(() {
                                    selectedDate = pickedDate;
                                  });
                                },
                                icon: Icon(Icons.calendar_month),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  SizedBox(height: 10),
                  if (width >= 600)
                    Row(
                      children: [
                        Spacer(),
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text('Cancel'),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            final pickedAmount = double.tryParse(
                              amountController.text,
                            );
                            final isAmountValid =
                                pickedAmount == null || pickedAmount <= 0;
                            if (isAmountValid ||
                                titleController.text.isEmpty ||
                                selectedDate == null) {
                              showDialog(
                                context: context,
                                builder:
                                    (context) => AlertDialog(
                                      actions: [
                                        TextButton(
                                          onPressed:
                                              () => Navigator.pop(context),
                                          child: Text('Okay'),
                                        ),
                                      ],
                                      title: Text('Invalid input'),
                                      content: Text(
                                        'Please make sure your title, amount, and date is valid',
                                      ),
                                    ),
                              );
                              return;
                            }
                            widget.onAddExpense(
                              ExpensesModel(
                                title: titleController.text,
                                amount: pickedAmount,
                                date: selectedDate!,
                                category: selectedCategory,
                              ),
                            );
                            Navigator.pop(context);
                          },
                          child: Text('Save'),
                        ),
                      ],
                    )
                  else
                    Row(
                      children: [
                        DropdownButton(
                          borderRadius: BorderRadius.circular(16),
                          alignment: Alignment.center,
                          value: selectedCategory,
                          items:
                              Category.values.map((category) {
                                return DropdownMenuItem(
                                  value: category,
                                  child: Text(category.name.toUpperCase()),
                                );
                              }).toList(),
                          onChanged: (value) {
                            if (selectedCategory == null) {
                              return;
                            }
                            setState(() {
                              selectedCategory = value!;
                            });
                          },
                        ),
                        Spacer(),
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text('Cancel'),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            final pickedAmount = double.tryParse(
                              amountController.text,
                            );
                            final isAmountValid =
                                pickedAmount == null || pickedAmount <= 0;
                            if (isAmountValid ||
                                titleController.text.isEmpty ||
                                selectedDate == null) {
                              showDialog(
                                context: context,
                                builder:
                                    (context) => AlertDialog(
                                      actions: [
                                        TextButton(
                                          onPressed:
                                              () => Navigator.pop(context),
                                          child: Text('Okay'),
                                        ),
                                      ],
                                      title: Text('Invalid input'),
                                      content: Text(
                                        'Please make sure your title, amount, and date is valid',
                                      ),
                                    ),
                              );
                              return;
                            }
                            widget.onAddExpense(
                              ExpensesModel(
                                title: titleController.text,
                                amount: pickedAmount,
                                date: selectedDate!,
                                category: selectedCategory,
                              ),
                            );
                            Navigator.pop(context);
                          },
                          child: Text('Save'),
                        ),
                      ],
                    ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
