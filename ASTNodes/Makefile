ASTDIR   = ./ASTNodes/

NODES    =  NodeAbstract Type NodeDumpable BooleanType Declaration \
				Float32Type Float64Type Float96Type FloatType Initializer \
				Int16Type Int32Type Int64Type Int8Type IntType ObjectType \
				StringType TemplateDeclaration TypeModifier UInt16Type \
				UInt32Type UInt64Type UInt8Type UIntType VectorType \
            Port DataFlowTypeModifier ASDFTypeModifier BASDFTypeModifier \
            SDFTypeModifier Source Filename FieldVarDecl\
            ValueBase VoidType AutomaticType VariableDeclaration Tilde Bang \
            Allocation New Returns UnaryPlus UnaryMinus Super Nill This \
            QualifiedName DelayedName StreamOption StreamPropertyList \
            VariableStreams Referencing MethodReferencing \
            StreamReferencing VariableReferencing ArgumentList \
            MethodArgumentList StreamArgumentList ClassDeclaration \
            GenericList GenericTypeParam GenericClassParam Generic \
            GenericTypeMultiple Inherit ClassImplements ClassExtends ClassNoInherit \
            Body EmptyBody Interface Visibility Private Protected \
            Public Access FieldAccess ArrayAccess Parameter \
            PlaceholderParameter StorageModifier Constant Static NonAtomic \
            ClassInitializer EmptyClassInitializer ConstructorDeclaration \
            StreamModifier Modifier StreamingMethodDeclaration Converge \
            Fork EmptyStreamModifier EmptyTypeModifier MethodDeclaration \
            ClassInherit MethodInherit MethodImplements MethodOverrides \
            MethodNoInherit NoParameter Block EmptyBlock \
            StreamEdges StreamInput StreamOutput NoStreamInput NoStreamOutput \
            ParameterList NoParameterList SimpleParameter \
            ArrayParameter SizedArrayParameter NoTypeModifier NoArgumentList \
            InstantiationModifier Final System Abstract NoInstantiationModifier \
            DynamicArray NoSizeParameter NoDynamicArray \
            GenericInstantiationList NoGenericInstantiation GenericInstantiation \
            Equals Assignment ArraySize Increment Decrement AssPlus \
            AssMinus Plus Minus MathOp Operation CondOp LOROp LANDOp \
            OrOp HatOp AndOp EqualityOp EqualOp NotEqualOp GreaterThanOp \
            LessThanOp LessEqualOp GreaterEqualOp MultOp DivOp ModOp \
            LeftShiftOp RightShiftOp TypeCastExpression Free Expression \
            CastExpression BitOperation \
            ArrayInitialization BoolArrayInitialization \
            NumArrayInitialization StrArrayInitialization \
            AllOthersInArray ArraySlice EmptyStatement \
				Statement IfStatement WhileStatement ForStatement MapStatement 

ASTNODES = $(addprefix $(ASTDIR), $(NODES))            

ASTCPPFILES = $(addsuffix .cpp, $(ASTNODES))

ASTNODEOBJS = $(addsuffix .o,   $(ASTNODES))

ASTOBJS = $(ASTNODEOBJS) 

ASTCLEAN =  $(ASTOBJS)

nodes: $(ASTCPPFILES)
	$(MAKE) $(ASTNODEOBJS)
