define Process {
@public:
   autogen impl;
@private:
   string impl;
}

define LoadStoreProcess {

}

define FPGAProcess {

}

define C_Process {
@public:
   autogen cpu_affinity; /* automatically make get / set */
@private:
   size_t cpu_affinity( 0 );
   super.set_impl(CPUProcess);   
}

define Process<C++> : public Process <C> {
   option void   set_cpu_affinity( size_t cpuid );
   option size_t get_cpu_affinity();
   impl(CPlusPlusProcess);
}

define lang Java {
   impl(JavaProcess);
}

define platform x86 {
   produce C(Cx86Produce);
   produce C++(CPlusPlusx86Produce);
   produce Java(Javax86Produce);
}

define platform ARM {
   produce C(CARMProduce);
   produce C++(CPlusPlusARMProduce);
}


