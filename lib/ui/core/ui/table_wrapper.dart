import 'package:flutter/material.dart';

class TableWrapper extends StatefulWidget {
  final Widget table;

  const TableWrapper({super.key, required this.table});

  @override
  State<TableWrapper> createState() => _TableWrapperState();
}

class _TableWrapperState extends State<TableWrapper> {
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      controller: _scrollController,
      thumbVisibility: true,
      child: SingleChildScrollView(
        scrollDirection: .horizontal,
        controller: _scrollController,
        child: ConstrainedBox(
          constraints: BoxConstraints(minWidth: 800),
          child: widget.table,
        ),
      ),
    );
  }
}
